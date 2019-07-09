<?php
/**
 * Created by PhpStorm.
 * User: wilder
 * Date: 02/07/19
 * Time: 13:56
 */

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
     * @Route("/inspiration", name="inspiration")
     */
    public function inspiration()
    {
        return $this->render('about/inspiration.html.twig');
    }

    /**
     * @Route("/faq", name="faq")
     */
    public function faq()
    {
        return $this->render('about/faq.html.twig');
    }

    /**
     * @Route("/presse", name="presse")
     */
    public function presse()
    {
        return $this->render('about/presse.html.twig');
    }

    /**
     * @Route("/de-nous", name="qui_sommes_nous")
     */
    public function aboutUs()
    {
        return $this->render('about/aboutUs.html.twig');
    }

    /**
     * @Route("/mention-légale", name="mention_légale")
     */
    public function legalMention()
    {
        return $this->render('about/legalMention.html.twig');
    }

    /**
     * @Route("/nos-engagements", name="nos_engaments")
     */
    public function ourEngagements()
    {
        return $this->render('about/ourEngagements.html.twig');
    }
}
