<?php

namespace App\Controller;

use App\Entity\Agency;
use App\Entity\Client;
use App\Form\ForgotPasswordType;
use App\Form\RegistrationAgencyType;
use App\Form\RegistrationClientType;
use App\Security\LoginFormAuthenticator;
use Swift_Mailer;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Guard\GuardAuthenticatorHandler;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

/**
 * @Route("/compte", name="compte_")
 */
class SecurityController extends AbstractController
{
    /**
     * @Route("/inscription", name="client")
     */
    public function registrationClient(
        Request $request,
        ObjectManager $manager,
        UserPasswordEncoderInterface $encoder,
        LoginFormAuthenticator $authenticator,
        GuardAuthenticatorHandler $guardHandler
    ): Response {
        $client = new Client();
        $agency = new Agency();

        $clientForm = $this->createForm(RegistrationClientType::class, $client);
        $clientForm->handleRequest($request);

        $agencyForm = $this->createForm(RegistrationAgencyType::class, $agency);
        $agencyForm->handleRequest($request);

        if ($clientForm->isSubmitted() && $clientForm->isValid()) {
            $hash = $encoder->encodePassword($client, $client->getPassword());
            $client->setPassword($hash);

            $manager->persist($client);
            $manager->flush();
            return $guardHandler->authenticateUserAndHandleSuccess(
                $client,
                $request,
                $authenticator,
                'main'
            );
        }
        if ($agencyForm->isSubmitted() && $agencyForm->isValid()) {
            $hash = $encoder->encodePassword($agency, $agency->getPassword());
            $agency->setPassword($hash);

            $manager->persist($agency);
            $manager->flush();
            return $guardHandler->authenticateUserAndHandleSuccess(
                $agency,
                $request,
                $authenticator,
                'main'
            );
        }
        return $this->render('security/compte.html.twig', [
            'agencyForm' => $agencyForm->createView(),
            'clientForm' => $clientForm->createView(),
        ]);
    }

    /**
     * @route("/connexion", name="connexion")
     */
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render(
            'security/login.html.twig',
            ['last_username' => $lastUsername, 'error' => $error]
        );
    }

    /**
     * @route("/deconnexion", name="deconnexion")
     */
    public function logout()
    {
    }
    /**
     * @route("/oublis", name="oublis")
     */
    public function forgotPassword(Request $request, Swift_Mailer $mailer) :Response
    {
        $client = new Client();

        $forgotForm = $this->createForm(ForgotPasswordType::class, $client);
        $forgotForm->handleRequest($request);
        $data = $forgotForm->getdata();

        if ($forgotForm->isSubmitted() && $forgotForm->isValid()) {
            $message = (new \Swift_Message('Réinitialisation du mot de passe'))
                ->setFrom('edwintililian2702@gmail.com')
                ->setTo($data->getEmail())
                ->setBody(
                    $this->renderView(
                        'security/password_link.html.twig'
                    )
                );
            $mailer->send($message);
        }
        return $this->render('security/forgot_password.html.twig', [
            'forgotForm' => $forgotForm->createView(),
        ]);
    }

    /**
     * @route("/nouveau_mot_de_passe", name="nouveau_mot_de_passe")
     */
    public function updatePassword() :Response
    {
        return $this->render('security/update_password.html.twig');
    }
}
