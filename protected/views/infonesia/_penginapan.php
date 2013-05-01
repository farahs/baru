<?php
?>

<div class="view">


        <?php
        $criteria = new CDbCriteria;

        $this->widget('zii.widgets.CListView', array(
            'dataProvider'=>$dataProvider,
            'itemView'=>'penginapan',
            'enablePagination'=>true,
            'enableSorting' => false,
        ));?>

</div>