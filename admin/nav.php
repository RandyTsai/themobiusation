<nav id="nav-wrapper">
    
    <div id="nav-back" class="mobile-button"><i class="fal fa-chevron-left"></i></div>
    <div id="nav-close" class="mobile-button"><i class="far fa-times"></i></div>

    <div id="nav-inner">
        <?php
		
        //Top nav
		$nav_html = '';
		$sub_nav_active = false;
		
        foreach($module_enabled as $key => $val){
			
			if($val == false){
				continue;
			}
			
            if($adminInfo['category'] == 0 || in_array($key, $Auth->getUserPermission())){
                if(is_array($val)){
                    $nav_html .= '<li class="'.(array_key_exists(CURRENT_FOLDER, $val['module'])?'active':'').'"><a href="../'.$key.'/" class="has-subnav">'.$Lang->_($val['label']).'</a>';
					//Sub nav
					$nav_html .= '<ul class="sub-nav nav-list">';
        			foreach($module_enabled[$key]['module'] as $key1 => $val1){
						
						if($val1 == false){
							continue;
						}
			
						if($adminInfo['category'] == 0 || in_array($key1, $Auth->getUserPermission())){
                   			$nav_html .= '<li '.(CURRENT_FOLDER == $key1?'class="active"':'').'><a href="../'.$key1.'/">'.$Lang->_($val1).'</a></li>';
							
							if(CURRENT_FOLDER == $key1){
								$sub_nav_active = true;
							}
                		}
        			}
            		$nav_html .= '</ul>';
		
					$nav_html .= '</li>';
                }else if($val != '|'){
                    $nav_html .= '<li '.(CURRENT_FOLDER == $key?'class="active"':'').'><a href="../'.$key.'/">'.$Lang->_($val).'</a></li>';
                }else if($val == '|' && $adminInfo['category'] == 0){
                    $nav_html .= '<li class="nav-seperator">|</li>';
                }
            }
        }
        echo '<ul id="top-nav" class="nav-list '.($sub_nav_active?'sub-active':'').'">'.$nav_html.'</ul>';
        ?>
    </div>
</nav>
<div id="nav-mask"></div>
