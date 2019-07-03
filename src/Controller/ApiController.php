<?php

namespace App\Controller;

use App\Repository\StageRepository;
use App\Repository\MessageRepository;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ApiController extends AbstractController
{
    /**
     * @Route(
     *   "/api/stages",
     *   name="api_stages",
     *   options = {
     *     "expose" = true
     *   }
     * )
     */
    public function listStage(StageRepository $stageRepo, SerializerInterface $serializer)
    {
        $stages = $stageRepo->findAll();
        return $this->json($stages, 200, [], ['groups'=>'api']);
    }

    /**
     * @Route(
     *   "/api/{user}",
     *   name="api_messages",
     *   options = {
     *     "expose" = true
     *   }
     * )
     */
    public function listMessage(MessageRepository $messageRepo, SerializerInterface $serializer)
    {
        $stages = $messageRepo->findAll();
        return $this->json($stages, 200, [], ['groups'=>'api']);
    }
}
