<?php

namespace App\DataFixtures;

use App\Entity\Client;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Faker;

class ClientFixtures extends Fixture
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
    }

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
                    ->setPassword($this->passwordEncoder->encodePassword(
                        $client,
                        'clientmdp'
                    ))
                    ->setRoles(['ROLE_CLIENTS']);
            $manager->persist($client);
            $this->addReference('client_'.strval($i), $client);
        }

        $manager->flush();
    }
}
