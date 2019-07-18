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
        for ($i = 1; $i < 400; $i++) {
            $faker = Factory::create('fr_FR');
            $message = new Message();
            $type=['client', 'agency'];
            $rand=rand(0, 1);
            $history=$this->getReference("history_".strval(rand(1, 3)));
            $message->setContent($faker->sentence)
                    ->setSendAt($faker->dateTime())
                    ->setHistories($history)
                    ->setClient($this->getReference('client_'.rand(1, 4)))
                    ->setAgency($history->getAgency());
            if ($i%10==0) {
                $message->setAdmin(true)
                        ->setSender($rand>0?'user':$type[$rand])
                        ->setReceiver($rand>0?$type[$rand]:'user');
            } else {
                $message->setSender($type[$rand])
                        ->setReceiver($type[abs($rand-1)]);
            }
            $manager->persist($message);
        }
        $manager->flush();
    }
}
