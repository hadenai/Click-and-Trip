<?php

namespace App\Controller;

use App\Form\ContactFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/a-propos")
 */
class AboutController extends AbstractController
{
    /**
     * @Route("/contact")
     */
    public function contactForm(Request $request, \Swift_Mailer $mailer)
    {
        $form = $this->createForm(ContactFormType::class);
        $form->handleRequest($request);
        $data = $form->getData();
        if ($form->isSubmitted() && $form->isValid()) {
            $message = (new \Swift_Message('Un nouveau formulaire de contacte a été soumis.'))
                ->setFrom($_ENV['MAILER_CONTACT'])
                ->setTo($_ENV['MAILER_CONTACT'])
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
     * @Route("/services-associe")
     */
    public function affiliateService()
    {
        return $this->render('about/affiliateService.html.twig');
    }

    /**
     * @Route("/cgu")
     */
    public function cgu()
    {
        return $this->render("about/cgu.html.twig");
    }

    /**
     * @Route("/nos-engagements")
     */
    public function commitment()
    {
        return $this->render("about/commitment.html.twig");
    }
}
