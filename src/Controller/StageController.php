<?php

namespace App\Controller;

use App\Entity\Stage;
use App\Form\StageType;
use App\Repository\StageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Doctrine\Common\Annotations\DocLexer;

/**
 * @Route("/etapes")
 */
class StageController extends AbstractController
{
    /**
     * @Route("/", name="stage_index", methods={"GET"})
     */
    public function index(StageRepository $stageRepository): Response
    {
        return $this->render('stage/index.html.twig', [
            'stages' => $stageRepository->findAll(),
        ]);
    }
    /**
     * @Route("/ajouter", name="stage_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $stage = new Stage();
        $form = $this->createForm(StageType::class, $stage);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($stage);
            $entityManager->flush();

            return $this->redirectToRoute('stage_index');
        }
        return $this->render('stage/new.html.twig', [
            'stage' => $stage,
            'form' => $form->createView(),
        ]);
    }
    /**
     * @Route("/{id}", name="stage_show", methods={"GET"})
     */
    public function show(Stage $stage): Response
    {
        return $this->render('stage/show.html.twig', [
            'stage' => $stage,
        ]);
    }
    /**
     * @Route("/{id}/edit", name="stage_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Stage $stage): Response
    {
        $form = $this->createForm(StageType::class, $stage);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('stage_index', [
                'id' => $stage->getId(),
            ]);
        }
        return $this->render('stage/edit.html.twig', [
            'stage' => $stage,
            'form' => $form->createView(),
        ]);
    }
    /**
     * @Route("/{id}", name="stage_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Stage $stage): Response
    {
        if ($this->isCsrfTokenValid('delete'.$stage->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($stage);
            $entityManager->flush();
        }
        return $this->redirectToRoute('stage_index');
    }

    /**
     * @Route("/{nameStage}", name="stage_detail")
     */
    public function stageDetail(Stage $stage)
    {
        return $this->render('stage/details.html.twig', [
            'stage' => $stage,
        ]);
    }
}
