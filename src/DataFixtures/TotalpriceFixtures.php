<?php

namespace App\DataFixtures;

use App\Entity\Price;
use App\Repository\StageRepository;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class TotalpriceFixtures extends Fixture
{   
    private $stageRepo;

    public function __construct(StageRepository $stageRepo){
        $this->stageRepo= $stageRepo;
    }

    public function load(ObjectManager $manager)
    {   
        // // /!\ I had just put one price by stage instead of multiple for each specs (persons, season,...)
        $stages=$this->stageRepo->findAll();
        foreach($stages as $stage){
            $price = new Price();
            $price->setStage($stage)
                  ->setDateBegin(01/01/00)
                  ->setDateEnd(31/31/00)
                  ->setPersons(2)
                  ->setPrice(100);
            $manager->persist($price);
        };
        $manager->flush();
    }
}
