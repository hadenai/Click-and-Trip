<?php

namespace App\DataFixtures;

use Faker\Factory;
use App\Entity\Message;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class MessageFixtures extends Fixture implements DependentFixtureInterface
{
    public function getDependencies()
    {
        return [
            SizeFixtures::class,
            StyleFixtures::class,
            ThemeFixtures::class,
            ClientFixtures::class,
            HistoryFixtures::class
        ];
    }
    public function load(ObjectManager $manager)
    {
        for ($i = 1; $i < 40; $i++) {
            $faker = Factory::create('fr_FR');
            $message = new Message();
            $history=$this->getReference("history_".strval(rand(1, 3)));
            $message->setContent($faker->sentence)
                    ->setSendAt($faker->dateTime())
                    ->setClient($this->getReference('client_'.rand(1, 4)))
                    ->setAgency($history->getAgency())
                    ->setHistory($history);
            $manager->persist($message);
        }
        $manager->flush();
    }
}
