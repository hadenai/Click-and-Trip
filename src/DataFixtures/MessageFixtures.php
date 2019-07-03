<?php

namespace App\DataFixtures;

use App\Entity\Message;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker\Factory;

class MessageFixtures extends Fixture
{
    public function getDependencies()
    {
        return [SizeFixtures::class,StyleFixtures::class,ThemeFixtures::class];
    }
    public function load(ObjectManager $manager)
    {
        for ($i = 1; $i < 6; $i++) {
            $faker = Factory::create('fr_FR');
            $message = new Message();
            $message->setContent($faker->sentence)
                    ->setSendAt($faker->dateTime());
            $manager->persist($message);
        }
        $manager->flush();
    }

}
