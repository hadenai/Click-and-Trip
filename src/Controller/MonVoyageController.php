<?php
/**
 * Created by PhpStorm.
 * User: wilder
 * Date: 12/06/19
 * Time: 09:56
 */

namespace App\Controller;

use App\Form\TravelerDetailFormType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Form\FormBuilderInterface;

/**
 * @Route("/monvoyage")
 */
class MonVoyageController extends AbstractController
{
    /**
     * @Route("/mesinfos")
     */
    public function sendTravelerInfoMail(Request $request, \Swift_Mailer $mailer)
    {
        $form = $this->createForm(TravelerDetailFormType::class);
        $form->handleRequest($request);
        $data = $form->getData();
        if ($form->isSubmitted()) {
            $message = (new \Swift_Message('Un nouveau formulaire de contacte a été soumis.'))
                ->setFrom('vincent.mallard5@gmail.com')
                ->setTo('vincent.mallard5@gmail.com')
                ->setBody(
                    $this->renderView(
                        "travelerDetailMail.html.twig",
                        [
                            "data" => $data,
                        ]
                    ),
                    'text/html'
                );
            $mailer->send($message);
        }
        return $this->render('travelerDetailForm.html.twig', [
                "form" => $form->createView()
            ]);
    }
}
