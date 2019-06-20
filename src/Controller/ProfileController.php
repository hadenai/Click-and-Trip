<?php

namespace App\Controller;

use App\Entity\History;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\HistoryRepository;

/**
 * @Route("/profile", name="profile_")
 */

class ProfileController extends AbstractController
{
    // /**
    //  * @Route("/", name="index")
    //  */
    // public function index() : Response
    // {
    //     return $this->render('profile/index.html.twig', [

    //     ]);
    // }
    /**
     * @Route("/historique", name="history", methods={"GET"})
     */
    public function adminHistoryView(HistoryRepository $historyRepository, UserRepository $userRepository): Response
    {
        return $this->render('profile/history.html.twig', [
            'histories' => $historyRepository->findAllHistoryInfos($this->getUser()),
        ]);
    }
}
