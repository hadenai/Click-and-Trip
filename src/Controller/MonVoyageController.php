<?php
/**
 * Created by PhpStorm.
 * User: wilder
 * Date: 12/06/19
 * Time: 09:56
 */

namespace App\Controller;

use Dompdf\Dompdf;
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
    public function sendTravelerInfoMail()
    {


        return $this->render('travelerDetailForm.html.twig');
    }
}
