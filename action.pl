###############################
#Custom Condition:
# blank

###############################
#Custom action preparation code:
return 1;  #this is important

###############################
#Custom action cleanup code:
use List::MoreUtils 'any';

# high priority account list
my @accounts = {
    'jnoah@osuosl.org',
    'jldugger@osuosl.org',
    'bryon@osuosl.org',
};

my $PRIORITY = 10;

# See if the requestor is in the list of high priority accounts
my $requestor_addresses = $self->TicketObj->RequestorAddresses();
my $in_list = any { /$requestor_addresses/ } @accounts;

# If in the list, set the priority
if ($in_list) {
    $self->TicketObj->SetPriority( $PRIORITY );
}

return 1;
