<?php

namespace App\Controller;

use App\Entity\Agency;
use App\Entity\Client;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
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
     * @Route("/monvoyage/planner", name="planner")
     */
    public function planner(): Response
    {
        return $this->render('planner/listing.html.twig');
    }
}
