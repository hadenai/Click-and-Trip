<?php

namespace App\Controller;

use App\Entity\Stage;
use App\Entity\Agency;
use App\Entity\History;
use App\Entity\Message;
use App\Repository\PriceRepository;
use App\Repository\HistoryRepository;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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
            'type' => strtolower(explode("\\", get_class($user))[2])
        ]);
    }

    /**
     * @Route("/messagerie/nouveau", name="send_message")
     * options = {
     *      "expose" = true
     *     }
     */
    public function newMessage(ObjectManager $manager, HistoryRepository $historyRepo)
    {

        // $from,
        // $to,
        // $content,
        // $admin,
        // $idHistory

        // $message= new Message();
        // $history=$historyRepo->findOneBy(['id'=> $idHistory]);
        // $date=date('Y-m-d H:i:s');
        // $message->setContent($content)
        //             ->setSendAt($date)
        //             ->setHistories($history)
        //             ->setClient()
        //             ->setAgency();
    }
}
