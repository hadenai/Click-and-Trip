<?php

namespace App\DataFixtures;

use Faker;
use App\Entity\Agency;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AgencyFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        for ($i=1; $i<12; $i++) {
            $faker  =  Faker\Factory::create('fr_FR');
            $agency = new Agency();
            $agency->setAddress($faker->address())
                   ->setCity($faker->city())
                   ->setCompany($faker->company())
                   ->setCountry($faker->country())
                   ->setEmail($faker->freeEmail())
                   ->setPassword($faker->password())
                   ->setRoles(['ROLE_AGENCY'])
                   ->setNameAgent($faker->firstNameMale())
                   ->setSurnameAgent($faker->lastname());
                   //    ->setUsername($faker->userName())
            $manager->persist($agency);
            $this->addReference('agency_'.strval($i), $agency);
        };

        $manager->flush();
    }
}
