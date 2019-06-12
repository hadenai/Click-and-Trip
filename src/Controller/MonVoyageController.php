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
    public function generatePdf()
    {
        $dompdf = new Dompdf();

        $html = $this->renderView('travelerDetailForm.html.twig');
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();
        $dompdf->stream("mypdf.pdf", [

            "Attachement" => true,
        ]);

        return $this->render('travelerDetailForm.html.twig');
    }

}