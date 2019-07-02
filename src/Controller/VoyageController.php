<?php

namespace App\Controller;

use App\Entity\Agency;
use App\Entity\History;
use App\Entity\Stage;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;

class VoyageController extends AbstractController
{
    /**
     * @Route("/", name="homepage")
     */
    public function index(): Response
    {
        return $this->render('homepage/index.html.twig');
    }

    /**
     * @Route("/mon-voyage/planner", name="planner")
     */
    public function planner(): Response
    {
        return $this->render('planner/listing.html.twig');
    }

    /**
     * @Route(
     *     "/mon-voyage/envoi",
     *     name="success",
     *     options = {
     *      "expose" = true
     *     }
     *     )
     */
    public function addHistory(ObjectManager $manager, Request $request) : Response
    {
        dd($request->request);
       /*     $history = new History();
            $stage = new Stage();
            $agency = $this->getDoctrine()
                ->getRepository(Agency::class)
                ->findOneBy(['id' => 3]);
            $client = $this->getUser();
           /* $history->setDateEnd()
                ->setDateBegin()
                ->setStateId()
                ->setClient()
                ->setAgency()
                ->addStage();
            $manager->persist($history);
            $manager->flush();*/
       return $this->render('homepage/index.html.twig');
    }
}
