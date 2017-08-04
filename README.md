# Test-SlideOutMenu



##### RU:
 Пример реализации Slide-Out Menu с помощью [LGSideMenuController](https://github.com/Friend-LGA/LGSideMenuController).
 Работа с констрейнтами вместе с [FLKAutoLayout](https://github.com/floriankugler/FLKAutoLayout) .
 Приложение стартует с экрана LoginVC, далее по нажатию кнопки SigIn. По нажатию на нее инициализируется несколько контроллеров:
 
----
##### EN:
An example implementation of the Slide-Out Menu using [LGSideMenuController](https://github.com/Friend-LGA/LGSideMenuController) .
Working with the constraints along with [FLKAutoLayout](https://github.com/floriankugler/FLKAutoLayout) .
The app starts with a screen LoginVC, then click the button SigIn. By clicking on it initializes several controllers:
 
----

<br><br><br>


### Разбор кода / Code review
<br>

 #import "LoginVC.m" 
 ```objective-c 
 
    MainTVC*  mainTVC  = [[MainTVC alloc] init];           // Главный экран таблица 
    LeftMenuTVC*  leftTVC  = [[LeftMenuTVC alloc] init];   // Таблица для левого меню 
    RightMenuTVC* rightTVC = [[RightMenuTVC alloc] init];  // Таблица для правого меню 
     
    // НавКотроллер на котором разместим кнопки вызова меню 
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainTVC]; 
    
    // Коренной контроллер для меню в который передаем настроенный NavContr(с mainTVC внутри) и боковыми контроллерами  
    LGSideMenuController *sideMenuController = [LGSideMenuController sideMenuControllerWithRootViewController:navigationController  
                                                                                           leftViewController:leftTVC 
                                                                                         rightViewController:rightTVC];  
    // Презентим на экран
    [self presentViewController:sideMenuController animated:YES completion:nil];

 ```  
 <br>
 
----

<br>

<br><br>
В #import "MainTVC.h" происходит дополнительная надстройка
 ```objective-c 

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"LGSideMenuController";
        // Задаем картинки для кнопок на НавБаре

        UIImage *hamburg = [[UIImage imageNamed:@"Hamburg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *inbox   = [[UIImage imageNamed:@"Inbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:hamburg 
                                                                                 style:UIBarButtonItemStylePlain 
                                                                                 target:self 
                                                                                 action:@selector(showLeftView)];

        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:inbox 
                                                                                  style:UIBarButtonItemStylePlain
                                                                                  target:self 
                                                                                  action:@selector(showRightView)];
    }
    return self;
}
```
<br>

----

<br>
<br><br>
Вызов меню через жесты имлементированы внутрь кода и самим реализовывать их нам не надо.
Так они вызываются вручную

 ```objective-c 
- (void)showLeftView {
    [self.sideMenuController showLeftViewAnimated:YES completionHandler:nil];
}

- (void)showRightView {
    [self.sideMenuController showRightViewAnimated:YES completionHandler:nil];
}
```

<br>

----

<br>


<br><br>
 ```objective-c 

// Обратная связь осуществляется через вытаскивание контроллера из navigationController.rootViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UINavigationController *mainNavContr = (UINavigationController *)self.sideMenuController.rootViewController;
    
    if (mainNavContr.viewControllers.count>0)
    {
        if ([mainNavContr.viewControllers[0] isKindOfClass:[MainTVC class]])
        {
            MainTVC* mainTVC = (MainTVC*)mainNavContr.viewControllers[0];
            [mainTVC updateTableContentWithCategory:indexPath.row];
        }
    }    
    [self hideLeftViewAnimated:nil];
}
```
<br>

----

<br>
<br><br>

---

### Storyboard project:


![alt text](https://raw.githubusercontent.com/HackDeveloperUA/Test-SlideOutMenu/master/ScreenShots/ScreenOfProject.png)

<br><br><br>

###  Экраны / Screens:

| LoginVC  | MainTVC |
| ------------- | ------------- |
| ![alt text](https://raw.githubusercontent.com/HackDeveloperUA/Test-SlideOutMenu/master/ScreenShots/1.png)  | ![alt text](https://raw.githubusercontent.com/HackDeveloperUA/Test-SlideOutMenu/master/ScreenShots/2.png)  |
|             |              |
|             |              |
| LeftMenuTVC | RightMenuTVC |
| ![alt text](https://raw.githubusercontent.com/HackDeveloperUA/Test-SlideOutMenu/master/ScreenShots/3.png)  | ![alt text](https://raw.githubusercontent.com/HackDeveloperUA/Test-SlideOutMenu/master/ScreenShots/4.png) |

