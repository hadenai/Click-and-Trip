<?php

namespace App\Controller;

use DateTime;
use App\Entity\Stage;
use App\Entity\Agency;
use App\Entity\History;
use App\Entity\Message;
use App\Repository\PriceRepository;
use App\Repository\AgencyRepository;
use App\Repository\ClientRepository;
use App\Repository\HistoryRepository;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Form\AccountAgencyType;
use App\Form\AccountClientType;

/**
 * @Route("/profil", name="profil_",
 * options = {
 *      "expose" = true
 *     })
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
            'agencyBool' => $this->getUser() instanceof Agency
        ]);
    }

    /**
     * @Route("/editer/client", name="edit_client")
     */
    public function editProfileClient(Request $request, ObjectManager $manager) :Response
    {
        $client = $this->getUser();

        $form = $this->createForm(AccountClientType::class, $client);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($client);
            $manager->flush();
            $this->redirectToRoute('homepage');
        }

        return $this->render('profil/editClient.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/editer/agence", name="edit_agency")
     */
    public function editProfileAgency(Request $request, ObjectManager $manager) :Response
    {
        $agency = $this->getUser();

        $form = $this->createForm(AccountAgencyType::class, $agency);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($agency);
            $manager->flush();
            $this->redirectToRoute('homepage');
        }

        return $this->render('profil/editAgency.html.twig', [
            'form' => $form->createView()
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
     * @Route("/messagerie/nouveau", name="send_message", methods={"POST"},
     * options = {
     *      "expose" = true
     *     })
     */
    public function newMessage(
        Request $request,
        ObjectManager $manager,
        HistoryRepository $historyRepo,
        ClientRepository $clientRepo,
        AgencyRepository $agencyRepo
    ) : Response {
        $json = json_decode($request->getContent());
        $message= new Message();
        $message->setHistories($historyRepo->findOneBy(['id' => $json->idHistory]))
                ->setAdmin($json->adminBool)
                ->setSendAt(new DateTime(date("Y-m-d H:i:s")))
                ->setContent($json->content);
        $to=[$json->to->type, $json->to->id];
        $from=[$json->from->type, $json->from->id];
        if ($from[0]=='agency') {
            $message->setSender('agency')
                    ->setReceiver('client')
                    ->setAgency($agencyRepo->findOneBy(['id' => $from[1]]))
                    ->setClient($clientRepo->findOneBy(['id' => $to[1]]));
        } else {
            $message->setSender('client')
                    ->setReceiver('agency')
                    ->setClient($clientRepo->findOneBy(['id' => $from[1]]))
                    ->setAgency($agencyRepo->findOneBy(['id' => $to[1]]));
        }
        $manager->persist($message);
        $manager->flush();
        return $this->json([], 200);
    }
}
