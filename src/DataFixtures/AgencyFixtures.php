<?php

namespace App\DataFixtures;

use Faker;
use App\Entity\Agency;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AgencyFixtures extends Fixture
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
    }

    public function load(ObjectManager $manager): void
    {
        // Make agency accounts
        for ($i=1; $i<12; $i++) {
            $faker  =  Faker\Factory::create('fr_FR');
            $agency = new Agency();
            $agency->setAddress($faker->address())
                   ->setCity($faker->city())
                   ->setCompany($faker->company())
                   ->setCountry($faker->country())
                   ->setNameAgent($faker->firstNameMale())
                   ->setSurnameAgent($faker->lastname())
                   ->setYearCreation(2000+$i)
                   ->setDescription($faker->sentence(40))
                   ->setFlagship($faker->sentence(10))
                   ->setPresentation($faker->sentence(25))
                    ->setEmail($faker->freeEmail())
                    ->setPassword($this->passwordEncoder->encodePassword(
                        $agency,
                        'agencemdp'
                    ))
                    ->setRoles(['ROLE_AGENCY'])
                    ->setMobile($faker->phoneNumber());
            $manager->persist($agency);
            $this->addReference('agency_'.strval($i), $agency);
        }
        $manager->flush();
    }
}
