<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;

class VoyageController extends AbstractController
{
    /**
     * @Route("/", name="homepage")
     */
    public function index() : Response
    {
        return $this->render('homepage/index.html.twig');
    }

    /**
     * @Route("/monVoyage/planner", name="planner")
     */
    public function planner() : Response
    {
        return $this->render('planner/listing.html.twig');
    }

    /**
     * @Route("/monVoyage/MesInfos" , name="Voyage_mesInfos")
     */
    public function sendTravelerInfoMail(\Swift_Mailer $mailer) : Response
    {
        $message = (new \Swift_Message('Un nouvel article vient d\'être publié !'))
            ->setFrom('vincent.mallard5@gmail.com')
            ->setTo('vincent.mallard5@gmail.com')
            ->setBody(
                $this->renderView(
                    "travelerDetailMail.html.twig",
                    [
                    'name' => $mailer
                    ]
                ),
                'text/html'
            );

        $mailer->send($message);

        return $this->render('travelerDetailForm.html.twig');
    }
}
