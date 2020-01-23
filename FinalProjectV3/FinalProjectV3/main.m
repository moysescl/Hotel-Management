//
//  main.m
//  FinalProjectV2
//
//  Created by english on 2019-11-28.
//  Copyright © 2019 Moyses. All rights reserved.
//

#import <Foundation/Foundation.h>


//Using interface
@interface Person : NSObject
@property int idNum;
@property  NSString *fn, *ln, *pw;

-(void)displayPinfo;

@end

//====================================
// Implementation of class Person
//====================================
@implementation Person

@synthesize idNum, fn, ln, pw;


//====================================
//Display info of registered customers
//====================================

-(void)displayPinfo{
    
    if (fn==nil) {
        
        NSLog(@"\n\n\t\tNo customer registered! Make registration first!");
        
    }
    else NSLog(@"\nID: %i \nFirst Name: %@ \nLast Name: %@ \nPassword: %@", idNum, fn, ln, pw);
    
    
}

@end

//=========================================
//Using interface
//declaring variable to the class client
//=========================================
@interface Client : Person
@property int stNum;
@property NSString *stName, *city, *postalCode;


-(void)dispClientInfo; //show customers info
@end

@implementation Client
@synthesize stNum, stName, city, postalCode;
-(void)dispClientInfo

{
    NSLog(@"\n Address: %i %@, %@, %@", stNum, stName, city, postalCode);
}

@end

//==================================
//Using interface
//=================================
@interface Room : NSObject
@property int roomNum, dispn;
@property NSString *roomType;
@property float roomPrice;
-(void)dispRoomInfo;
-(void)defRoomInfo: (int) n :(NSString *) t :(int) s :(float) p;
@end


//=============================
//Room details
//=============================
@implementation Room
@synthesize roomNum, dispn, roomType, roomPrice;


//=============================
//Show room details
//=============================
-(void)dispRoomInfo

{
    
    NSLog(@"\nRoom List \nRoom Number: %i \nType: %@ \nStatus: %i \nPrice: %.2f ", roomNum, roomType, dispn, roomPrice);
    
};

-(void) defRoomInfo :(int) n :(NSString *) t :(int) s :(float) p {
    
    roomNum = n;
    roomType = t;
    dispn = s;
    roomPrice = p;
    
};

@end


//=======================================
//Using interface optional services
//=======================================

@interface Service : NSObject @property NSString *sType; @property float sPrice;


-(void)dispServInfo;
-(void)setServiceData: (NSString *) t :(float) p;
@end

@implementation Service @synthesize sType, sPrice;




//========================================
//Display services info
//========================================
-(void)dispServInfo

{
    
    NSLog(@"\nService List \nType: %@ \nPrice: %.2f ", sType, sPrice);
    
};

-(void) setServiceData :(NSString *) t :(float) p {
    
    sType = t;
    sPrice = p;
    };

@end


//========================================
//Interface reservation
//========================================
@interface Reservation : NSObject @property int cId, rNum; @property NSString *typeS; @property float roomPr, sPrice;

-(void)prd;  //show reservation info

-(void)srd: (int) ci: (int) rn: (NSString *)st: (float) rp: (float)sp;

@end

//========================================
//Implementing reservation
//========================================
@implementation Reservation @synthesize cId, rNum, typeS, roomPr, sPrice;

-(void)prd

{
    
    NSLog(@"\n\tReservation records: \n\n\t\tClient Id: %i -- Room number: %i -- Service Type: %@ -- Room Price: %.2f -- Service Price: %.2f ", cId, rNum, typeS, roomPr, sPrice);
    
};

-(void)srd: (int) ci: (int) rn: (NSString *) st :(float) rp: (float) sp {
    
    cId = ci;
    rNum = rn;
    typeS = st;
    roomPr = rp;
    sPrice = sp;
    
};

@end

//======================================
//Interface for waitlist
//=======================================
@interface WaitList: NSObject @property int clId; @property NSString *rType;


-(void)dispWInfo;
-(void)swd: (int) cNo: (NSString *) rt;

@end


//========================================
//Wait list implementation
//=========================================
@implementation WaitList @synthesize clId, rType;

-(void)dispWInfo //show wait list info

{
    
    NSLog(@"\nWaiting List \nClient Id: %i \nRoom Type: %@ ", clId, rType);
    
};



-(void)swd: (int) cid :(NSString *) rt  {
    
    clId = cid;
    
    rType = rt;
    
};

@end

//========================================
//Application starts here
//========================================
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        Room * r1 = [[Room alloc] init];
        Room * r2 = [[Room alloc] init];
        Room * r3 = [[Room alloc] init];
        
        [ r1 defRoomInfo:1 :@"Standard" :0:50.00];
        [ r2 defRoomInfo:2 :@"Double Twin" :0:90.00];
        [ r3 defRoomInfo:3 :@"Suite" :1:200.00];
        
        NSArray * arrRoom = [NSArray arrayWithObjects :r1, r2, r3, nil ];
        
        Service * s1 = [[Service alloc] init];
        Service * s2 = [[Service alloc] init];
        Service * s3 = [[Service alloc] init];
        
        
        [ s1 setServiceData:@"Massage" :100.00];
        [ s2 setServiceData:@"Spa" :50.00];
        [ s3 setServiceData:@"Fitness Center":20.00];
        
        NSArray * arrService = [NSArray arrayWithObjects :s1, s2, s3, nil ];
        
        
        NSMutableArray <Reservation *> *arrayRes;
        NSMutableArray <Client *> *arrayCli;
        NSMutableArray<WaitList *> *arrayWl;
        
        Client *aClient = [[Client alloc] init];
        Reservation *es1 = [[Reservation alloc] init];
        WaitList *wlt=[[WaitList alloc]init];
        
        
        int option;
        int provId;
        int prRoom;
        char prFn[50];
        char prLn[50];
        int streetNum;
        char prSn[50];
        char prCity[50];
        char prPcode[50];
        char prPin[50];
        char provServ[50];
        
        NSString *fn1;
        NSString *ln1;
        NSString *strName;
        NSString *acity;
        NSString *apCode;
        NSString *aPin;
        NSString *type7;
        
                    
        do {
            
            
 //===========================================
 //Main menu
 //===========================================
            
            NSLog(@"\n\n\t\t\t\t\tHotel Management System.\n\n\t\tChose one of the options bellow:\n\n\t\t1-Create your profile.\n\t\t2-Make a reservation.\n\t\t3-Display.\n\t\t4-Exit.");
            
            scanf("%i",&option);
            
    
            
            switch (option) {
                    
                case 1:
                    
                    NSLog(@"Enter Id:");
                    
                    scanf("%i",&provId);
                
                    NSLog(@"Enter First Name:");
                    
                    scanf("%s",prFn);
                                      
                    
                    fn1 = [NSString stringWithCString:prFn encoding:1];
                                        
                    
                    NSLog(@"Enter Last Name:");
                    
                    scanf("%s",prLn);
                    
                    ln1 = [NSString stringWithCString:prLn encoding:1];
                                        
                    
                    NSLog(@"Enter Street Number:");
                    
                    scanf("%i",&streetNum);
                    
                    
                    
                    NSLog(@"Enter Street Name:");
                    
                    scanf("%s",prSn);
                    
                    strName = [NSString stringWithCString:prSn encoding:1];
                    
                    
                    
                    NSLog(@"Enter City:");
                    
                    scanf("%s",prCity);
                    
                    acity = [NSString stringWithCString:prCity encoding:1];
                    
                    
                    
                    NSLog(@"Enter Zip Code:");
                    
                    scanf("%s",prPcode);
                    
                    apCode = [NSString stringWithCString:prPcode encoding:1];
                    
                    
                    
                    NSLog(@"Enter Password:");
                    
                    scanf("%s",prPin);
                    
                    aPin = [NSString stringWithCString:prPin encoding:1];
                    
                                        
                    aClient.idNum = provId;
                    aClient.fn=fn1;
                    aClient.ln=ln1;
                    aClient.stNum = streetNum;
                    aClient.stName = strName;
                    aClient.city = acity;
                    aClient.postalCode = apCode;
                    aClient.pw=aPin;
                    [arrayCli addObject :aClient];
                                        
                    int aRes=1;
                    
                    NSLog(@"Whould you loke to make a reservation?  \n\tChoose:\nt\t1-yes \n\t\t2-");
                    
                    scanf("%i",&aRes);
                    
                    if (aRes==1) {
                        
                                                                            
                        NSLog(@"\n\tChoose a room type from the following list:");
                        
                        [r1 dispRoomInfo];
                        [r2 dispRoomInfo];
                        [r3 dispRoomInfo];
                        
                        int aStroom=0;
                        
                        int aux, aRPrice;
                                                
                        do {
                            
                            scanf("%i",&prRoom); //check this point later
                            aux=prRoom;
                                                        
                            for (int i = 0; i < [arrRoom count]; i++) {
                                
                                if ( (1+i)==aux) {
                                    
                                    NSLog(@"%i",[arrRoom[i] dispn]);
                                    aStroom =[arrRoom[i] dispn];
                                    aRPrice=[arrRoom[i] roomPrice];
                                }
                                                                
                            }
                            
                            if (aStroom==0) {
                                
                                NSLog(@"\n\tThis romm is currently unnavaiable, please try again\n\tYou are in the waiting list.");
                                
                                wlt.clId = provId;
                                
                                                                
                                for (int i = 0; i < [arrRoom count]; i++) {
                                    if (   [arrRoom[i] roomNum] ==aux ) {
                                        wlt.rType=[arrRoom[i] roomType];
                                                                            
                                    }
                                    
                                }
                                
                                [arrayWl addObject :wlt];
                                [wlt dispWInfo];
                                
                            }
                            
                        } while (aStroom==0);
                        NSLog(@"Selection of extra services, chose:");
                        [s1 dispServInfo];
                        [s2 dispServInfo];
                        [s3 dispServInfo];
                        scanf("%s",provServ);
                        type7 = [NSString stringWithCString:provServ encoding:1];
                        
                        int auxSprice;
                        for (int i = 0; i < [arrService count]; i++) {
                            if (   [[arrService[i] sType] isEqualToString:type7 ]) {
                                auxSprice=[arrService[i] sPrice];
                            }
                            
                        }
                        
                //=================================================
                //Reservation data
                //=================================================
                        es1.cId = provId;
                        es1.rNum = prRoom;
                        es1.typeS = type7;
                        es1.roomPr = aRPrice;
                        es1.sPrice=auxSprice;
                                               
                        
                        int total, numDays;
                        NSLog(@"\n\n\tHow long would you like to stay?");
                        scanf("%i",&numDays);
                        total=(aRPrice+auxSprice)*numDays;
                        [arrayRes addObject :es1];
                        
                        [es1 prd];
                        
                        NSLog(@"\nYou will pay \n total: %i",total);
                        
                    }
                    
                    break;
                    
                case 2:
                    
                    NSLog(@"Enter Id:");
                    scanf("%i",&provId);
                    NSLog(@"\n\tSelect your room type:");
                    [r1 dispRoomInfo];
                    [r2 dispRoomInfo];
                    [r3 dispRoomInfo];
                    int aStroom=0;
                    int temp, aRPrice;
                    
                    do {
                        scanf("%i",&prRoom);
                        temp=prRoom;   //check here
                        for (int i = 0; i < [arrRoom count]; i++) {
                            if ( (1+i)==temp) {
                                NSLog(@"%i",[arrRoom[i] dispn]);
                                aStroom =[arrRoom[i] dispn];
                                aRPrice=[arrRoom[i] roomPrice];
                            }
                                                        
                        }
                        if (aStroom==0) {
                            NSLog(@"\n\n\tSorry, this room is unavaiable...\n\tYour name was included in the wait list for this Type room");
                            wlt.clId = provId;
                                                        
                            for (int i = 0; i < [arrRoom count]; i++) {
                                if (   [arrRoom[i] roomNum] ==temp ) {
                                    wlt.rType=[arrRoom[i] roomType];
                                    
                                }
                                                                
                            }
                            [arrayWl addObject :wlt];
                            [wlt dispWInfo];
                        }
                    } while (aStroom==0);
                    NSLog(@"Select the extra services: ");
                    [s1 dispServInfo];
                    [s2 dispServInfo];
                    [s3 dispServInfo];
                    scanf("%s",provServ);
                    type7 = [NSString stringWithCString:provServ encoding:1];
                    int aSprice;
                    for (int i = 0; i < [arrService count]; i++) {
                        if (   [[arrService[i] sType] isEqualToString:type7 ]) {
                            aSprice=[arrService[i] sPrice];
                        }
                    }
                    
                    es1.cId = provId;
                    es1.rNum = prRoom;
                    es1.typeS = type7;
                    es1.roomPr = aRPrice;
                    es1.sPrice=aSprice;
                    int total, days;
                    NSLog(@"How long would you like to stay?");
                    scanf("%i",&days);
                    total=(aRPrice+aSprice)*days;
                    [arrayRes addObject :es1];
                    [es1 prd];
                    NSLog(@"\n\tThe price for your stay: \n\t total: %i",total);
                    break;
                    
                case 3:
                    [aClient displayPinfo];
                    [aClient dispClientInfo];
                    [es1 prd];
                    [wlt dispWInfo];
                    break;
                case 4:
                default:
                    break;
            }
                        
        } while (option !=4);
        NSLog(@"\n\t\tThanks for using ours services!");
        NSLog(@"\n\n\t\tBye Bye....");
    }
    return 0;
}
