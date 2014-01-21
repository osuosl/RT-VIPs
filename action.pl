use List::MoreUtils 'any';

# high priority account list
@accounts = {
    'jnoah@osuosl.org',
    'jldugger@osuosl.org',
};

my $PRIORITY = 10;

# See if the requestor is in the list of high priority accounts
my $requestor_addresses = $self->TicketObj->RequestorAdresses();
my $in_list = any { /$requestor_addresses/ } @accounts;

# If in the list, set the priority
if ($in_list) {
    $self->TicketObj->SetPriority($PRORITY);
}
