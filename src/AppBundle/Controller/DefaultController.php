<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{

    public function getDataAction($id)
    {
        $data = $this->get('doctrine.orm.entity_manager')
            ->getRepository('AppBundle:Data')
            ->find($id);
        return new JsonResponse($data);
    }

    public function getDatasAction()
    {
        $data = $this->get('doctrine.orm.entity_manager')
            ->getRepository('AppBundle:Data')
            ->findAll();
        return new JsonResponse($data);
    }
}
