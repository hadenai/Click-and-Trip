<?php

namespace App\Controller;

use App\Entity\Agency;
use App\Entity\History;
use App\Entity\Stage;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\ORM\EntityManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
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
     *     "/mon-voyage/details",
     *     name="details",
     *     options = {
     *      "expose" = true
     *     }
     *     )
     */
    public function details(ObjectManager $manager, Request $request, SessionInterface $session) : Response
    {
        $data = json_decode($request->getContent());
        $session->set('planner', $data);
        return $this->render('travelerDetailForm.html.twig');
    }
    /**
     *
     * @Route(
     *     "/mon-voyage/envoi",
     *     name="success",
     *     options = {
     *      "expose" = true
     *     }
     *     )
     */
    public function addHistory(ObjectManager $manager, EntityManager $em, SessionInterface $session) : Response
    {
        $data=$session->get('planner');
        $history = new History();
        foreach ($data as $key => $value) {
            //$em->getRepository();
        }
        $client = $this->getUser();
        /*$history->setDateEnd()
            ->setDateBegin()
            ->setStateId(1)
            ->setClient($client)
            ->setAgency($data["agency"])
            ->addStage();*/
        $manager->persist($history);
        $manager->flush();

        return $this->render('homepage/index.html.twig');
    }
}
