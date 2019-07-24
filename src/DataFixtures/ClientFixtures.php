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
            $image='client-'.strval($i).'.jpeg';
            if ($i==1) {
                copy(
                    __DIR__.'/../../assets/fixturesImages/'.$image,
                    __DIR__.'/../../assets/fixturesImages/client-'.strval($i-10).'.jpeg'
                );
                rename(
                    __DIR__.'/../../assets/fixturesImages/client-12.jpeg',
                    __DIR__.'/../../assets/fixturesImages/client-2.jpeg'
                );
            } else {
                copy(
                    __DIR__.'/../../assets/fixturesImages/'.$image,
                    __DIR__.'/../../assets/fixturesImages/client-'.strval($i+2).'.jpeg'
                );
            }
            $file = new UploadedFile(
                __DIR__.'/../../assets/fixturesImages/'.$image,
                $image,
                'image/jpeg',
                null,
                null,
                true /*  Set test mode true !!!
                " Local files are used in test mode hence
                the code should not enforce HTTP uploads." */
            );
            $client->setImageFile($file);
            $manager->persist($client);
            $this->addReference('client_'.strval($i), $client);
        }

        $manager->flush();
    }
}
