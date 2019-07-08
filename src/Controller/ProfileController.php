<?php
namespace App\Controller;

use App\Entity\Client;
use App\Form\AccountAgencyType;
use App\Form\AccountClientType;
use App\Repository\ClientRepository;
use App\Repository\UserRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\HistoryRepository;

/**
 * @Route("/profile", name="profile_")
 */
class ProfileController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(ClientRepository $repo) : Response
    {
        $client = $repo->findAll();

        return $this->render('profile/index.html.twig', [
            'client' => $client
        ]);
    }
    /**
     * @Route("/historique", name="history", methods={"GET"})
     */
    public function adminHistoryView(HistoryRepository $historyRepository, UserRepository $userRepository): Response
    {
        return $this->render('profile/history.html.twig', [
            'histories' => $historyRepository->findAllHistoryInfos($this->getUser()),
        ]);
    }

    /**
     * @Route("/editclient", name="edit_client")
     */
    public function editProfilesClient(Request $request, ObjectManager $manager) :Response
    {
        $client = $this->getUser();

        $form = $this->createForm(AccountClientType::class, $client);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($client);
            $manager->flush();
            $this->redirectToRoute('homepage');
        }

        return $this->render('profile/editClient.html.twig', [
            'form' => $form->createView()
        ]);
    }
    /**
     * @Route("/editagency", name="edit_agency")
     */
    public function editProfilesAgency(Request $request, ObjectManager $manager) :Response
    {
        $agency = $this->getUser();

        $form = $this->createForm(AccountAgencyType::class, $agency);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $manager->persist($agency);
            $manager->flush();
            $this->redirectToRoute('homepage');
        }

        return $this->render('profile/editAgency.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
