# encoding: UTF-8

Group.create(:id=>1,:title=>'admin')
Group.create(:id=>2,:title=>'manage')
Group.create(:id=>3,:title=>'user')
Group.create(:id=>4,:title=>'viewer')

User.create(:id=>1,:group_id=>1,:email => 'toughjjh@gmail.com',:name=>'정종호',:password => 'jjh123456', :password_confirmation => 'jjh123456',:gender=>'남자',:alternate_name=>'잠자는-사자',:description=>'깨끗한 웹세상을 꿈꾸는 웹프로그래머 잠자는-사자입니다.', :job_title=>'웹프로그래머',:url=>'http://www.sleepinglion.pe.kr',:photo=>File.open(Rails.root.join("app", "assets", "images", "intro", "sl.jpg")),:intro=>true,:admin=>true)
UserPhoto.create(:user_id=>1,:alt=>'jjh',:photo=>File.open(Rails.root.join("app", "assets", "images", "intro", "sl.jpg")))

GalleryCategory.create(:user_id=>1,:title=>'일상')
GalleryCategory.create(:user_id=>1,:title=>'멍멍이')
GalleryCategory.create(:user_id=>1,:title=>'가족들')
GalleryCategory.create(:user_id=>1,:title=>'풍경')
GalleryCategory.create(:user_id=>1,:title=>'기타') 

FaqCategory.create(:user_id=>1,:title=>'내소개')
FaqCategory.create(:user_id=>1,:title=>'리눅스')
FaqCategory.create(:user_id=>1,:title=>'웹개발')

BlogCategory.create(:id=>1,:user_id=>1,:leaf=>false,:title=>'내소개')
BlogCategory.create(:id=>2,:user_id=>1,:leaf=>false,:title=>'리눅스')
BlogCategory.create(:id=>3,:user_id=>1,:leaf=>false,:title=>'웹개발')
BlogCategory.create(:id=>4,:user_id=>1,:leaf=>true,:title=>'제작작품')
BlogCategory.create(:id=>5,:user_id=>1,:leaf=>true,:title=>'방명록')
BlogCategory.create(:id=>6,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'소개')
BlogCategory.create(:id=>7,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'일기')
BlogCategory.create(:id=>8,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'생각')
BlogCategory.create(:id=>9,:user_id=>1,:blog_category_id=>1,:leaf=>true,:title=>'사진첩')
BlogCategory.create(:id=>10,:user_id=>1,:blog_category_id=>2,:leaf=>true,:title=>'설치')
BlogCategory.create(:id=>11,:user_id=>1,:blog_category_id=>2,:leaf=>true,:title=>'응용프로그램')
BlogCategory.create(:id=>12,:user_id=>1,:blog_category_id=>2,:leaf=>true,:title=>'기본명령어')
BlogCategory.create(:id=>13,:user_id=>1,:blog_category_id=>2,:leaf=>true,:title=>'서버')
BlogCategory.create(:id=>14,:user_id=>1,:blog_category_id=>2,:leaf=>true,:title=>'html')
BlogCategory.create(:id=>15,:user_id=>1,:blog_category_id=>3,:leaf=>true,:title=>'스타일시트')
BlogCategory.create(:id=>16,:user_id=>1,:blog_category_id=>3,:leaf=>true,:title=>'자바스크립트')

Blog.create(:id=>1,:blog_category_id=>1,:user_id=>1,:title=>'잠자는-사자의 집이 다시 개장했습니다',:description=>'설명 읗믄ㅇ힘낭흐민ㅇㅎ ')
BlogContent.create(:id=>1,:content=>'그동안 수많은 방문자에 비해서 준비되지 못하였는데 이제 보다 업그레이드된 모습으로 다시 찾아뵙게되었습니다.
    잠자는-사자와 소통하는 공간으로 계속 많은 이용바랍니다.')

Notice.create(:id=>1,:user_id=>1,:title=>'잠자는-사자의 집이 다시 개장했습니다.')
NoticeContent.create(:id=>1,:content=>'그동안 수많은 방문자에 비해서 준비되지 못하였는데 이제 보다 업그레이드된 모습으로 다시 찾아뵙게되었습니다.
    잠자는-사자와 소통하는 공간으로 계속 많은 이용바랍니다.')
    
AdPosition.create!(:id=>1,:title=>'광고 표시안함',:position=>'none')
AdPosition.create!(:id=>2,:title=>'위에 표시',:position=>'top')
AdPosition.create!(:id=>3,:title=>'아래에 표시',:position=>'bottom')

SettingController.create(:id=>1,:ad_position_id=>3,:title=>'메인',:menu_display=>false,:controller=>'home',:description=>'처음화면',:priority=>9000)
SettingController.create(:id=>2,:ad_position_id=>3,:title=>'소개',:menu_display=>true,:controller=>'intro',:description=>'소개',:priority=>1000)
SettingController.create(:id=>3,:ad_position_id=>2,:title=>'갤러리',:menu_display=>true,:controller=>'galleries',:use_category=>true,:description=>'갤러리',:priority=>2000,:per=>60)
SettingController.create(:id=>4,:ad_position_id=>2,:title=>'블로그',:menu_display=>true,:controller=>'blogs',:use_category=>true,:description=>'블로그',:priority=>3000)
SettingController.create(:id=>5,:ad_position_id=>2,:title=>'질문, 답변',:menu_display=>true,:controller=>'questions',:description=>'질문,답변',:priority=>4000)
SettingController.create(:id=>6,:ad_position_id=>2,:title=>'FAQ',:menu_display=>false,:controller=>'faqs',:description=>'FAQ',:priority=>5000)
SettingController.create(:id=>7,:ad_position_id=>2,:title=>'상담,문의',:menu_display=>false,:controller=>'contacts',:menu_action=>'new',:description=>'상담 문의를 받을수 있게 합니다.',:priority=>6000)
SettingController.create(:id=>8,:ad_position_id=>1,:title=>'공지사항',:menu_display=>false,:controller=>'notices',:description=>'운영자가 방문자들에게 알릴 공지사항을 알릴수 있게 합니다.',:priority=>7000)
SettingController.create(:id=>9,:ad_position_id=>2,:title=>'방명록',:menu_display=>true,:controller=>'guest_books',:description=>'방문자가 글을 쓸수 있는 방명록입니다.',:priority=>8000)
SettingController.create(:id=>10,:ad_position_id=>2,:title=>'연혁',:menu_display=>false,:controller=>'histories',:description=>'연혁',:priority=>8000)
SettingController.create(:id=>11,:ad_position_id=>2,:title=>'포트폴리오',:menu_display=>true,:controller=>'portfolios',:description=>'포트폴리오',:priority=>8000)
SettingController.create(:id=>12,:ad_position_id=>2,:title=>'회원가입',:menu_display=>false,:controller=>'users',:menu_action=>'new',:description=>'사용자',:priority=>9000)
