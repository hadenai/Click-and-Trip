<?php

namespace App\Form;

use App\Entity\Stage;
use App\Form\PriceType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

class StageType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('validate')
            ->add('destination')
            ->add('reference')
            ->add('nameStage')
            ->add('duration')
            ->add('deleted')
            ->add('agency')
            ->add('themes')
            ->add('styles')
            ->add('sizes')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Stage::class,
        ]);
    }
}
