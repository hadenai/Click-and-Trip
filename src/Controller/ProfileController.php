<?php
namespace App\Controller;

use App\Entity\Agency;
use App\Entity\History;
use App\Entity\Stage;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\HistoryRepository;
use App\Repository\PriceRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Faker;

/**
 * @Route("/profile", name="profile_")
 */
class ProfileController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(): Response
    {
        return $this->render('profile/index.html.twig', [
        ]);
    }

    /**
     * @Route("/historique", name="history", methods={"GET"})
     */
    public function adminHistoryView(
        HistoryRepository $historyRepository,
        PriceRepository $priceRepository
    ): Response {
        return $this->render('profile/history.html.twig', [
            'histories' => $historyRepository->findAllHistoryInfos($this->getUser()),
        ]);
    }
}
