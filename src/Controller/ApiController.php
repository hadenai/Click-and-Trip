<?php

namespace App\Controller;

use App\Repository\StageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class ApiController extends AbstractController
{
    /**
     * @Route(
     *   "/api",
     *   name="api",
     *   options = {
     *     "expose" = true
     *   }
     * )
     */
    public function index(StageRepository $stageRepository, SerializerInterface $serializer)
    {
        $stages = $stageRepository->findAll();
        $jsonStages = $serializer->serialize($stages, 'json', ['groups'=>'api']);
        return new JsonResponse(json_decode($jsonStages));
    }
}
