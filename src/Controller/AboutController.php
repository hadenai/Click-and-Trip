<?php
/**
 * Created by PhpStorm.
 * User: wilder
 * Date: 02/07/19
 * Time: 13:56
 */

namespace App\Controller;

use App\Form\ContactFormType;
use App\Form\PartnerFormType;
use Swift_Mailer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/a-propos")
 */
class AboutController extends AbstractController
{
    /**
     * @Route("/contacte")
     */
    public function contactForm(Request $request, Swift_Mailer $mailer)
    {
        $form = $this->createForm(ContactFormType::class);
        $form->handleRequest($request);
        $data = $form->getData();
        dump($form->getErrors());
        if ($form->isSubmitted() && $form->isValid()) {
            $message = (new \Swift_Message('Un nouveau formulaire de contacte a été soumis.'))
                ->setFrom('vincent.mallard5@gmail.com')
                ->setTo('vincent.mallard5@gmail.com')
                ->setBody(
                    $this->renderView(
                        "contactFormMail.html.twig",
                        [
                            "data" => $data,
                        ]
                    ),
                    'text/html'
                );
            $mailer->send($message);
        }
        return $this->render(
            'contactForm.html.twig',
            [
                "contactForm" => $form->createView()
            ]
        );
    }

    /**
     * @Route("/devenir-partenaire")
     */
    public function bePartner(Swift_Mailer $mailer, Request $request)
    {
        $form = $this->createForm(PartnerFormType::Class);
        $form->handleRequest($request);
        $data = $form->getData();
        if ($form->isSubmitted() && $form->isValid()) {
            $message = (new \Swift_Message('Une nouvelle demande de partenariat a été soumise.'))
                ->setFrom('vincent.mallard5@gmail.com')
                ->setTo('vincent.mallard5@gmail.com')
                ->setBody(
                    $this->renderView(
                        "about/bePartnerMail.html.twig",
                        [
                            "data" => $data,
                        ]
                    ),
                    'text/html'
                );
            $mailer->send($message);
        }
        return $this->render(
            'about/bePartner.html.twig',
            [
                "form" => $form->createView()
            ]
        );
    }
}
