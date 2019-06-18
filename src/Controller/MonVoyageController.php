<?php
/**
 * Created by PhpStorm.
 * User: wilder
 * Date: 12/06/19
 * Time: 09:56
 */

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

/**
 * @Route("/MonVoyage")
 */
class MonVoyageController extends AbstractController
{
    /**
     * @Route("/MesInfos")
     */
    public function sendTravelerInfoMail(\Swift_Mailer $mailer)
    {
        $message = (new \Swift_Message('Un nouvel article vient d\'être publié !'))
            ->setFrom('vincent.mallard5@gmail.com')
            ->setTo('vincent.mallard5@gmail.com')
            ->setBody(
                $this->renderView(
                    "travelerDetailMail.html.twig",
                    [
                    'name' => $mailer
                    ]
                ),
                'text/html'
            );

        $mailer->send($message);

        return $this->render('travelerDetailForm.html.twig');
    }
}
