<?php

namespace App\DataFixtures;

use DateTime;
use DateInterval;

use App\Entity\Stage;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Symfony\Component\Serializer\Serializer;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Serializer\Encoder\CsvEncoder;
use Symfony\Component\Serializer\SerializerInterface;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;

class StageFixtures extends Fixture implements DependentFixtureInterface
{   
    private $serializer;

    public function __construct(SerializerInterface $serializer){
        $this->serializer=$serializer;
    }

    public function getDependencies()
    {
        return [SizeFixtures::class,StyleFixtures::class,ThemeFixtures::class];
    }

    public function load(ObjectManager $manager)
    {   
        // get csv for some stages /!\ some fake or complete datas
        // $serializer = new Serializer([new ObjectNormalizer()], [new CsvEncoder()]);
        $data = $this->serializer->decode(file_get_contents('test.csv'), 'csv',[CsvEncoder::DELIMITER_KEY => ";"]);
        // dd($data);
        foreach($data as $row){
            $stage = new Stage();
            $themes=explode("  ",$row["THEMATIQUES"]);
            foreach($themes as $theme){
                if(strpos($theme,"CULTURE")==FALSE){
                    $stage->addTheme($this->getReference('theme_0'));
                } elseif(strpos($theme,"SPORT")==FALSE){
                    $stage->addTheme($this->getReference('theme_1'));
                } elseif(strpos($theme,"BIEN")==FALSE){
                    $stage->addTheme($this->getReference('theme_2'));
                } elseif(strpos($theme,"NATURE")==FALSE){
                    $stage->addTheme($this->getReference('theme_3'));
                } elseif(strpos($theme,"FESTIVAL")==FALSE){
                    $stage->addTheme($this->getReference('theme_4'));
                } elseif(strpos($theme,"ILE")==FALSE){
                    $stage->addTheme($this->getReference('theme_5'));
                } elseif(strpos($theme,"RESPONSABLE")==FALSE){
                    $stage->addTheme($this->getReference('theme_6'));
                };
            };
            $sizes=explode("/",$row["AVEC QUI PARTIR"]);
            foreach($sizes as $size){
                if(strpos($size,"SOLO")==FALSE){
                    $stage->addSize($this->getReference('size_0'));
                } elseif(strpos($size,"COUPLE")==FALSE){
                    $stage->addSize($this->getReference('size_1'));
                } elseif(strpos($size,"FAMILLE")==FALSE){
                    $stage->addSize($this->getReference('size_2'));
                } elseif(strpos($size,"AMIS")==FALSE){
                    $stage->addSize($this->getReference('size_3'));
                } elseif(strpos($size,"GROUPE")==FALSE){
                    $stage->addSize($this->getReference('size_4'));
                };
            };
            $styles=explode("/",$row["STYLE"]);
            foreach($styles as $style){
                if(strpos($style,"STANDARD")==FALSE){
                    $stage->addStyle($this->getReference('style_0'));
                } elseif(strpos($style,"CHEZ")==FALSE){
                    $stage->addStyle($this->getReference('style_1'));
                } elseif(strpos($style,"CHARME")==FALSE){
                    $stage->addStyle($this->getReference('style_2'));
                } elseif(strpos($style,"LUXE")==FALSE){
                    $stage->addStyle($this->getReference('style_3'));
                } elseif(strpos($style,"RESPONSABLE")==FALSE){
                    $stage->addStyle($this->getReference('style_4'));
                };
            };
            $stage->setValidate(TRUE)
                  ->setReference($row["Ref"])
                  ->setDestination($row["DESTINATION"])
                  ->setNameStage($row["nameStage"])
                  ->setDuration(strval(trim($row["Duration"])))
                  ->setAgency($this->getReference('agency_'.$row["agency_id"]));
            $manager->persist($stage);
        }
        $manager->flush();
    }
}
