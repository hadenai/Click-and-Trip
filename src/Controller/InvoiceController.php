<?php

namespace App\Controller;

use App\Entity\History;
use Konekt\PdfInvoice\InvoicePrinter;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class InvoiceController extends AbstractController
{

    /**
     * @Route("/facture/{id}", name="invoice")
     */
    public function invoice(History $history)
    {
        $invoice = new InvoicePrinter('A4', '€', 'fr');
        $invoice->setLogo("build/images/small-logo.jpg", 120, 140);
        $invoice->setColor("#fd5e5c");
        $invoice->setType("Facture");
        $invoice->setReference("INV-55033645");
        $invoice->setNumberFormat('.', ' ');
        $invoice->setDate(date('d/m/y', time()));
        $invoice->setTime(date('H:i'));
        $invoice->setFrom([
            utf8_decode("Click And Trip"),
            utf8_decode($history->getAgency()->getCity()),
            $history->getAgency()->getNameAgent(),
            $history->getAgency()->getyearCreation()
        ]);
        $completeName=$history->getClient()->getName().' '.$history->getClient()->getSurname();
        $invoice->setTo([
            utf8_decode($completeName),
            utf8_decode("Adresse :"),
            utf8_decode($history->getClient()->getAddress()),
            $history->getClient()->getMobile(),
        ]);
        $totalPrice = 0;
        foreach ($history->getStages() as $stage) {
            $invoice->addItem(
                $stage->getNameStage(),
                false,
                utf8_decode(strval($stage->getDuration()).' jours'),
                0,
                utf8_decode(strval($stage->getPrices()[0])),
                false,
                utf8_decode(strval($stage->getPrices()[0]))
            );
            $totalPrice = $totalPrice + strval($stage->getPrices()[0]);
        };
        $taxe = $totalPrice / 100 * 20;
        $invoice->addTotal("Total", $totalPrice);
        $invoice->addTotal("Taxe GFM 20%", $taxe);
        $invoice->addTotal("Total à payer", $totalPrice + $taxe, true);

        $invoice->addParagraph($history->getComments());

        return new RedirectResponse(
            $invoice->render(
                'facture-'.strval($history->getId())."-"
                .str_replace(':', '-', str_replace(' ', '-', strval(date("Y-m-d H:i:s")))).'.pdf',
                'I'
            )
        );
    }
}
