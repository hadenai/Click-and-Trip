<?php

namespace App\DataFixtures;

use App\Entity\Price;
use App\Repository\StageRepository;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use DateTime;

class PriceFixtures extends Fixture implements DependentFixtureInterface
{
    public function getDependencies(): array
    {
        return [StageFixtures::class];
    }

    public function load(ObjectManager $manager): void
    {
        // // /!\ I had just put one price by stage instead of multiple for each specs (persons, season,...)
        for ($i=0; $i<50; $i++) {
            $price = new Price();
            $price->setStage($this->getReference('stage_'.strval($i)))
                  ->setDateBegin(new DateTime(2000-01-01))
                  ->setDateEnd(new DateTime(2000-12-31))
                  ->setPersons(2)
                  ->setPrice(100);
            $manager->persist($price);
        };
        $manager->flush();
    }
}
