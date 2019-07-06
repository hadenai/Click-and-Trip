<?php

namespace App\Controller;

use App\Entity\Agency;
use App\Entity\History;
use App\Entity\Stage;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\HistoryRepository;
use App\Repository\PriceRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Bundle\FixturesBundle\Fixture;

/**
 * @Route("/profil", name="profil_")
 */
class ProfilController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(): Response
    {
        return $this->render('profil/index.html.twig', [
        ]);
    }

    /**
     * @Route("/historique", name="history", methods={"GET"})
     */
    public function adminHistoryView(
        HistoryRepository $historyRepository,
        PriceRepository $priceRepository
    ): Response {
        return $this->render('profil/history.html.twig', [
            'histories' => $historyRepository->findAllHistoryInfos($this->getUser()),
        ]);
    }

    /**
     * @Route("/messagerie", name="mailbox")
     */
    public function listMessages(): Response
    {
        $user=$this->getUser();
        return $this->render('mailbox/listmessages.html.twig', [
            'id' => $user->getId(),
            'type' => strtolower(get_class($user))
        ]);
    }
}
