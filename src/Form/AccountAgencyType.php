<?php

namespace App\Form;

use App\Entity\Agency;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AccountAgencyType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('email')
            ->add('password')
            ->add('password', PasswordType::class)
            ->add('confirm_password', PasswordType::class)
            ->add('country')
            ->add('city')
            ->add('address')
            ->add('image')
            ->add('company')
            ->add('nameAgent')
            ->add('surnameAgent')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Agency::class,
        ]);
    }
}
