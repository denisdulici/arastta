<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" onclick="save('save')" form="form-geo-zone" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-success"><i class="fa fa-check"></i></button>
                <button type="submit" form="form-geo-zone" data-toggle="tooltip" title="<?php echo $button_saveclose; ?>" class="btn btn-default" data-original-title="Save & Close"><i class="fa fa-save text-success"></i></button>
                <button type="submit" onclick="save('new')" form="form-geo-zone" data-toggle="tooltip" title="<?php echo $button_savenew; ?>" class="btn btn-default" data-original-title="Save & New"><i class="fa fa-plus text-success"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-times-circle text-danger"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-geo-zone" class="form-horizontal">
            <div class="row">
                <div class="left-col col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="general">
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                                        <?php if ($error_name) { ?>
                                        <div class="text-danger"><?php echo $error_name; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="description" value="<?php echo $description; ?>" placeholder="<?php echo $entry_description; ?>" id="input-description" class="form-control" />
                                        <?php if ($error_description) { ?>
                                        <div class="text-danger"><?php echo $error_description; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><?php echo $text_items; ?></h3>
                            <div class="pull-right">
                                <div class="panel-chevron"><i class="fa fa-chevron-up rotate-reset"></i></div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="items">
                                <table id="zone-to-geo-zone" class="table table-striped table-hover">
                                    <thead>
                                    <tr>
                                        <td class="text-left"><?php echo $entry_country; ?></td>
                                        <td class="text-left"><?php echo $entry_zone; ?></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $zone_to_geo_zone_row = 0; ?>
                                    <?php foreach ($zone_to_geo_zones as $zone_to_geo_zone) { ?>
                                    <tr id="zone-to-geo-zone-row<?php echo $zone_to_geo_zone_row; ?>">
                                        <td class="text-left"><select name="zone_to_geo_zone[<?php echo $zone_to_geo_zone_row; ?>][country_id]" id="country<?php echo $zone_to_geo_zone_row; ?>" class="form-control" onchange="getZone('#zone<?php echo $zone_to_geo_zone_row; ?>', this.value, '0');">
                                            <?php foreach ($countries as $country) { ?>
                                            <?php  if ($country['country_id'] == $zone_to_geo_zone['country_id']) { ?>
                                            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo stripslashes($country['name']); ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $country['country_id']; ?>"><?php echo stripslashes($country['name']); ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                        </select></td>
                                        <td class="text-left"><select name="zone_to_geo_zone[<?php echo $zone_to_geo_zone_row; ?>][zone_id]" id="zone<?php echo $zone_to_geo_zone_row; ?>" class="form-control">
                                            <option value="0"><?php echo $text_all_zones; ?></option>
                                            <?php foreach ($zone_to_geo_zone['zone'] as $zone) { ?>
                                            <?php  if ($zone_to_geo_zone['zone_id'] == $zone['zone_id']) { ?>
                                            <option value="<?php echo $zone['zone_id']; ?>" selected="selected"><?php echo $zone['zone_name']; ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $zone['zone_id']; ?>"><?php echo $zone['zone_name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                        </select></td>
                                        <td class="text-left"><button type="button" onclick="$('#zone-to-geo-zone-row<?php echo $zone_to_geo_zone_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-sm btn-basic-list"><i class="fa fa-minus-circle"></i></button></td>
                                    </tr>
                                    <?php $zone_to_geo_zone_row++; ?>
                                    <?php } ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td class="text-left"><button type="button" onclick="addGeoZone();" data-toggle="tooltip" title="<?php echo $button_geo_zone_add; ?>" class="btn btn-primary btn-sm btn-basic-list"><i class="fa fa-plus-circle"></i></button></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript"><!--
    var zone_to_geo_zone_row = <?php echo $zone_to_geo_zone_row; ?>;

    function getZone(zoneID, country_id, zone_id){
        $.ajax({
            url: 'index.php?route=localisation/geo_zone/zone&token=<?php echo $token; ?>&country_id=' + country_id + '&zone_id=' + zone_id,
            type: 'post',
            dataType: 'html',
            success: function(html) {
                $(zoneID + ' option').remove();
                $(zoneID).append(html);
                $(zoneID).selectpicker('refresh');
            }
        });
    }

    function addGeoZone() {
        html  = '<tr id="zone-to-geo-zone-row' + zone_to_geo_zone_row + '">';
        html += '  <td class="text-left"><select name="zone_to_geo_zone[' + zone_to_geo_zone_row + '][country_id]" id="country' + zone_to_geo_zone_row + '" class="form-control" onchange="getZone(\'#zone' + zone_to_geo_zone_row + ' \', this.value ,\'0\');">';
        <?php foreach ($countries as $country) { ?>
        html += '<option value="<?php echo $country['country_id']; ?>"><?php echo addslashes($country['name']); ?></option>';
        <?php } ?>
        html += '</select></td>';
        html += '  <td class="text-left"><select name="zone_to_geo_zone[' + zone_to_geo_zone_row + '][zone_id]" id="zone' + zone_to_geo_zone_row + '" class="form-control"></select></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#zone-to-geo-zone-row' + zone_to_geo_zone_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger  btn-sm btn-basic-list"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#zone-to-geo-zone tbody').append(html);

        getZone('#zone' + zone_to_geo_zone_row, $('#country' + zone_to_geo_zone_row).val(), '0');

        zone_to_geo_zone_row++;
    }
    //--></script>
    <?php $zone_to_geo_zone_row = 0; ?>
    <?php foreach ($zone_to_geo_zones as $zone_to_geo_zone) { ?>
    <script type="text/javascript"><!--
    getZone('#zone<?php echo $zone_to_geo_zone_row; ?>',  '<?php echo $zone_to_geo_zone["country_id"]; ?>', '<?php echo $zone_to_geo_zone["zone_id"]; ?>');
    //--></script>
    <?php $zone_to_geo_zone_row++; ?>
    <?php } ?></div>
<?php echo $footer; ?>
