<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker;
use App\Entity\Client;

class ClientFixtures extends Fixture
{
    public function load(ObjectManager $manager) : void
    {
        for ($i=1; $i<5; $i++) {
            $faker  =  Faker\Factory::create('fr_FR');
            $client = new Client();
            $client->setAddress($faker->address())
                ->setMobile($faker->phoneNumber())
                ->setName($faker->firstNameMale())
                ->setSurname($faker->lastname())
                ->setDateOfBirth($faker->dateTime())
                ->setEmail($faker->email)
                ->setPassword($faker->password)
                ->setRoles(['ROLE_CLIENTS']);
            $manager->persist($client);
            $this->addReference('client_'.strval($i), $client);
        };

        $manager->flush();
    }
}
