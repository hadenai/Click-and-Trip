<?php

namespace App\DataFixtures;

use App\Entity\Client;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker;

class ClientFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // Make client accounts
        for ($i=1; $i<5; $i++) {
            $faker  =  Faker\Factory::create('fr_FR');
            $client = new Client();
            $client->setAddress($faker->address())
                ->setMobile($faker->phoneNumber())
                ->setName($faker->firstNameMale())
                ->setSurname($faker->lastname())
                ->setDateOfBirth($faker->dateTime())
                    ->setEmail($faker->email)
                    ->setPassword('clientmdp')
                    ->setRoles(['ROLE_CLIENTS']);
            $manager->persist($client);
            $this->addReference('client_'.strval($i), $client);
        }

        $manager->flush();
    }
}
