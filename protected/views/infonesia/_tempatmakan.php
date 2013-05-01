<?php
?>

<div class="view">

        <?php

        $this->widget('zii.widgets.CListView', array(
            'dataProvider'=>$dataProvider,
            'itemView'=>'tempatmakan',
            'enableSorting' => false,
        ));?>

</div>