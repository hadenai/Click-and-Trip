<?php

namespace App\DataFixtures;

use Faker;
use App\Entity\Agency;
use App\Entity\User;
use App\Entity\Client;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {   
        // Make agency accounts
        for ($i=1; $i<12; $i++) {
            $faker  =  Faker\Factory::create('fr_FR');
            $agency = new Agency();
            $user = new User();
            $agency->setAddress($faker->address())
                   ->setCity($faker->city())
                   ->setCompany($faker->company())
                   ->setCountry($faker->country())
                   ->setNameAgent($faker->firstNameMale())
                   ->setSurnameAgent($faker->lastname());
            $user->setAgency($agency)
                    ->setEmail($faker->freeEmail())
                    ->setPassword($faker->password())
                    ->setRoles(['ROLE_AGENCY']);
            $manager->persist($agency);
            $manager->persist($user);
            $this->addReference('agency_'.strval($i), $agency);
        };

        // Make client accounts
        for ($i=1; $i<5; $i++) {
            $faker  =  Faker\Factory::create('fr_FR');
            $client = new Client();
            $user = new User();
            $client->setAddress($faker->address())
                ->setMobile($faker->phoneNumber())
                ->setName($faker->firstNameMale())
                ->setSurname($faker->lastname())
                ->setDateOfBirth($faker->dateTime());
            $user->setClient($client)
                    ->setEmail($faker->email)
                    ->setPassword($faker->password)
                    ->setRoles(['ROLE_CLIENTS']);
            $manager->persist($client);
            $manager->persist($user);
            $this->addReference('client_'.strval($i), $client);
        };

        $manager->flush();
    }
}
