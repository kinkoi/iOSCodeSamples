
@interface BBConversationViewController () <UIActionSheetDelegate,
                                            UITableViewDelegate>


@property (nonatomic, weak) SMConversationPresenter *presenter;


- (void)setConversationPresenter:(SMConversationPresenter *)conversationPresenter {
    self.presenter = conversationPresenter;
}


- (void)viewDidLoad
{
    BB_TIMER_START( viewDidLoad );
}

- (void)viewWillAppear:(BOOL)animated
{
    if (!self.presenter) {
        self.presenter = [[SMConversationPresenter alloc] initWithStream:self.stream sourceMessage:self.sourceMessage];
    }

    self.presenter = [[SMConversationPresenter alloc] initWithStream:self.stream sourceMessage:self.sourceMessage];


    if (!self.stream.isEmailRoom) {
        UIBarButtonItem *detailsButton = [[UIBarButtonItem alloc]
                                          initWithImage:[UIImage imageNamed:@"icon-details.png"]
                                          style:UIBarButtonItemStyleDone
                                          target:self
                                          action:@selector(infoButtonAction:)];

        NSMutableArray* buttons = [[NSMutableArray alloc] initWithObjects:detailsButton, nil];

        self.navigationItem.rightBarButtonItems = buttons;
    }

}

- (void)infoButtonAction:(id)sender
{
    [self performSegueWithIdentifier:@"infoView" sender:nil];
}
