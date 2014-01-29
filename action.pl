###############################
#Custom Condition:
if (($self->TransactionObj->Type eq "Create")||(($self->TransactionObj->Type eq "Set")&&($self->TransactionObj->Field eq "Queue"))) {
        return 1;
    }

    return 0;



###############################
#Custom action preparation code:
return 1;  #this is important





###############################
#Custom action cleanup code:
use List::MoreUtils 'any';

# high priority account list
my @accounts = ('jnoah@osuosl.org','bryon@osuosl.org','jldugger@osuosl.org');

my $PRIORITY = 10;

# See if the requestor is in the list of high priority accounts
my @requestor_addresses = split(', ', $self->TicketObj->RequestorAddresses());


my $in_list = 0;
foreach my $val (@requestor_addresses) {
#    $RT::Logger->info("-".$val."-");
    if ($val ~~ @accounts){
        $in_list = 1;
    }
#    $RT::Logger->info("-".$in_list."-");
  }

if ($in_list) {
   $self->TicketObj->SetPriority( $PRIORITY );
}

return 1;
