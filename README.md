# Application Features

I implement SharedPreferences to prevent data loss when the application is closed and reopened.

## Home screen 
- displays the welcoming text, todo task that must be completed, and add task button

- the todo task is separated into two types, **priority** and **Daily**.

### priority task
- The priority task can be scrolled left and right
- There is progress indicator on the priority task so that user can see what is his progress on that task.
- If the task is not done, the background color is light purple, however if it's done, the background color will be a darker purple.
- If it is pressed, it will display the title, progress, and description of the task. There is *"Mark as Done"* button on there that if it is pressed, the task will be considered done.
- If it is long pressed, it will navigated to `edik task screen` where you can edit the title or the description of the task.
- If it is swiped up, the task will be deleted. 

### daily task
- The daily task can be scrolled up and down
- If the task is not done, the indicator circle's color of the task is white, however if it's done, the indicator circle's color will be purple and there will be a linethrough on the title of the task.
- If it is pressed, it will display the title and description of the task. There is "Mark as Done" button on there that if it is pressed, the task will be considered done.
- If it is long pressed, it will navigated to `edik task screen` where you can edit the title or the description of the task.
- If it is swiped left, the task will be deleted. 

## Add task screen
You can add the title and description of the task. Also, you can choose the category of the task by just clicking the category button.

## Edit task screen
You can edit the title and description of the task.

## Profile page sreen
By clicking the profile icon on the bottom navigation bar, yo will be directed to "AboutMe" page where you can see my profile information section.

# Packages used
- font_awesome_flutter: '>= 4.7.0'
- intl: ^0.19.0
- cupertino_icons: ^1.0.2
- shared_preferences: ^2.2.2
- json_annotation: ^4.8.1

# Essay
Proses Pengerjaan tugas Open Recruitement Mobile Development menurut saya sangatlah seru dan menantang. Setelah melihat figma yang diberikan, saya pun mulai untuk mengerjakan tugas yang diberikan dengan menjadikan figma tersebut sebagai referensi.  Mengerjakan proyek secara mandiri ternyata tidak mudah karena kurangnya masukkan dari orang lain. Namun, saya banyak mendapatkan pengalaman berharga dalam hal teknis.

Beberapa widget telah saya kenal sebelumnya saat mempelajari matkul PBP. Namun pada proyek kali ini, saya menjadi jauh lebih paham  mengenai bagaimana, kapan, dan trik-trik untuk menggabungkan antar widget menjadi satu kesatuan yang baik. 	Saya pun menjadi lebih paham dan terbayang akan widget lain seperti Gesturedetector yang memiliki fitur seperti onTap, onLongPress.

Saya sempat bingung pada bagaimana user berinteraksi agar dapat mendelete sebuah task. Namun setelah saya mencari tahu, terdapat widget Dismissible yang mana user dapat swipe dan kemudian task tersebut dapat dihapus. Saya mengetahui terdapat widget tersebut ketika sedang menonton sebuah video flutter di youtube yang mana membuat saya terinspirasi.

Hal lain yang saya dapatkan ketika mengerjakan proyek ini adalah saya menjadi lebih terlatih dalam membaca dokumentasi flutter. Sebelumnya, saya selalu cemas ketika dihadapkan dengan dengan dokumentasi karena saya merasa takut pusing dan tidak mengerti duluan. Namun sekarang, saya sudah tidak takut dan lebih mengerti akan apa yang dokumentasi maksudkan dan jelaskan.

Setelah mengerjakan proyek ini, saya menjadi lebih tertarik pada dunia mobile development. Senang rasanya dapat melihat aplikasi yang dibuat sendiri pada handphone. Saya ingin sekali agar dapat belajar dan mengembangkan kemampuan saya bersama dengan RISTEK. Dalam pembuatan ini, saya banyak mendapatkan referensi dari dokumentasi flutter, stackoverflow, dan youtube. Saya yakin permulaan saya dengan membuat proyek sederhana todo-app ini akan menjadi bekal yang baik untuk saya kedepannya.
