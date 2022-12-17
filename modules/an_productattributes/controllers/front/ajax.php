<?php
/**
 * 2022 Anvanto
 *
 * NOTICE OF LICENSE
 *
 * This file is not open source! Each license that you purchased is only available for 1 wesite only.
 * If you want to use this file on more websites (or projects), you need to purchase additional licenses. 
 * You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
 *
 *  @author Anvanto <anvantoco@gmail.com>
 *  @copyright  2022 Anvanto
 *  @license    Valid for 1 website (or project) for each purchase of license
 *  International Registered Trademark & Property of Anvanto
 */

require_once _PS_MODULE_DIR_ . 'an_productattributes/classes/anProductAttr.php';

class an_productattributesajaxModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        $result = array();
        if (Tools::isSubmit('action')) {
            $actionName = Tools::getValue('action', '') . 'Action';
            if (method_exists($this, $actionName)) {
                $result = $this->$actionName();
            }
        }

        die(Tools::jsonEncode($result));
    }    
    
    public function getProductAttributesAction()
    {
        if (Tools::getValue('token') != Tools::getToken(false)){
            Tools::redirect('index.php?controller=404');
        }
        
        $productId = (int) Tools::getValue('id_product');
        $this->product = new Product($productId, false, $this->context->language->id); 
        
        $product = $this->module->productPrepare($this->product, false, true);
        
        $product_full = Product::getProductProperties($this->context->language->id, $product);
        $attributesGroups = $this->module->assignAttributesGroups($this->product, $product_full); 
        
        //    referenceAttribute
        $referenceAttribute = '';
        if (isset($attributesGroups['combinations'][$product['id_product_attribute']]['reference'])){
            $referenceAttribute = $attributesGroups['combinations'][$product['id_product_attribute']]['reference'];
        }
                
        //    Prices        
        $prices = $this->module->getPrices($this->product, $product);
        
        // Images
        $productImages = anProductAttr::getProductImages($product, $this->context);
        $imageCover = anProductAttr::getProductCover($productImages);

        $variants = '';
        if ($this->module->getParam('type_view') != 'select'){
            
            $this->context->smarty->assign('config', $this->module->getConfig());
            if (isset($attributesGroups['groups'])){
                $this->context->smarty->assign('groups', $attributesGroups['groups']);
            }

            ////////////////////////////////////
            if ($this->module->getParam('color_type_view') == 'image' | $this->module->getParam('color_type_view') == 'only_image'){
                $this->context->smarty->assign('link', Context::getContext()->link);
                $combinationImages = $this->product->getCombinationImages($this->context->language->id);
                $this->context->smarty->assign('combinationImages', $combinationImages);
                $this->context->smarty->assign('product_link_rewrite', $product['link_rewrite']); 
            }
            ////////////////////////////////////    
            
            $this->context->smarty->assign('productId', $productId);
            $variants = $this->module->display($this->module->name, 'product-variants.tpl');
        }
        
        //    availability_message
        if ($this->product->available_now ){
            $available_now = $this->product->available_now;
        } else {
            $available_now = Configuration::get('PS_LABEL_IN_STOCK_PRODUCTS', $this->context->language->id);
        }
        if ($this->product->available_later ){
            $available_later = $this->product->available_later;
        } else {
            $available_later = Configuration::get('PS_LABEL_OOS_PRODUCTS_BOA', $this->context->language->id);
        }        
        
/*         if (isset($attributesGroups['combinations'][$product['id_product_attribute']]['quantity']) && $attributesGroups['combinations'][$product['id_product_attribute']]['quantity'] > 0){
            $availableLabel = $available_now;
        } else {
            $availableLabel = $available_later;
        } */
        
        //    delivery_in_stock
        $delivery_in_stock = $this->product->delivery_in_stock;
        if ($delivery_in_stock == ''){
            $delivery_in_stock = Configuration::get('PS_LABEL_DELIVERY_TIME_AVAILABLE', $this->context->language->id);
        }        
        
        $orderOutOfStock = (bool)Configuration::get('PS_STOCK_MANAGEMENT') && !Product::isAvailableWhenOutOfStock($product['out_of_stock']);

        $return = [
            'referenceAttribute' => $referenceAttribute,
            'delivery_in_stock' => $delivery_in_stock,
        
            'prices' => $prices,
            'id_product_attribute' => $product['id_product_attribute'], // it needs for some functions

            'imageCover' => $imageCover,
            
            'order_out_of_stock' => $orderOutOfStock,
                        
            'quantity' => $product['quantity'],
            'quantity_wanted' => $product['quantity_wanted'],
            'minimal_quantity' => $product['minimal_quantity'],
            'availableForOrder' => intval($product['availableForOrder']),
            'token' => Tools::getToken(false),
        ];

        if ($variants != '' ){
            $return['variants'] = $variants;
        }    

        if (count($productImages)>0){
            $return['images'] = $productImages;
        }
      
        die(Tools::jsonEncode($return));
    }    
    





}