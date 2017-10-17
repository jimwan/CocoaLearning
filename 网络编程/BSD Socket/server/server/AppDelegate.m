//
//  AppDelegate.m
//  server
//
//  Created by user on 3/3/17.
//  Copyright © 2017 trendmicro. All rights reserved.
//

#import "AppDelegate.h"
#import <sys/socket.h>
#import <arpa/inet.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *clientMessage;
@property (weak) IBOutlet NSTextField *serverMessage;

@property (assign) int clnt_sock;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    //创建套接字
    int serv_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    u_long ul=1;
    //ioctlsocket(serv_sock,FIONBIO,(u_long*)&ul);

    //将套接字和IP、端口绑定
    struct sockaddr_in serv_addr;
    memset(&serv_addr, 0, sizeof(serv_addr));  //每个字节都用0填充
    serv_addr.sin_family = AF_INET;  //使用IPv4地址
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");  //具体的IP地址
    serv_addr.sin_port = htons(1234);  //端口
    bind(serv_sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr));
    //进入监听状态，等待用户发起请求
    listen(serv_sock, 20);

    //接收客户端请求
    struct sockaddr_in clnt_addr;
    socklen_t clnt_addr_size = sizeof(clnt_addr);

    //while(1)
    {

        _clnt_sock = accept(serv_sock, (struct sockaddr*)&clnt_addr, &clnt_addr_size);
        //向客户端发送数据
        char str[] = "Hello World!";
        send(_clnt_sock, str, sizeof(str),0);

        //关闭套接字
        close(_clnt_sock);

    }


    close(serv_sock);

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)sendMessageToClient:(id)sender
{
    send(_clnt_sock, _serverMessage.stringValue.UTF8String, _serverMessage.stringValue.length,0);
}
@end
