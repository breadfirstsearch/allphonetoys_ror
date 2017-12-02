# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Admin.delete_all
Transaction.delete_all
Location.delete_all
Provider.delete_all

=begin
u=User.new
u.name="jibin"
u.password="jibin"
u.email="jibin@gmail.com"
u.phone="1234567890"
u.pref_amount="19"
u.pref_location="Gardens"
u.pref_provider="Lyca"
u.save

t=Transaction.new
t.amount=19
t.phone_number=1234567890
t.provider="Lyca"
t.location="Gardens"
t.status="Picked Up"
t.user=u
t.save

t=Transaction.new
t.amount=45
t.phone_number=1234567890
t.provider="Lyca"
t.location="Gardens"
t.status="Scheduled"
t.user=u
t.save

u=User.new
u.name="christopher"
u.password="christopher"
u.email="christopher@gmail.com"
u.phone="1234567891"
u.pref_amount="23"
u.pref_location="Gardens"
u.pref_provider="Lyca"
u.save

t=Transaction.new
t.amount=23
t.phone_number=1234567891
t.provider="Lyca"
t.location="Gardens"
t.status="Picked Up"
t.user=u
t.save

u=User.new
u.name="kavya"
u.password="kavya"
u.email="kavya@gmail.com"
u.phone="1234567892"
u.pref_amount="26"
u.pref_location="College Main"
u.pref_provider="AT&T"
u.save

t=Transaction.new
t.amount=26
t.phone_number=1234567892
t.provider="AT&T"
t.location="College Main"
t.status="Recharged"
t.user=u
t.save

u=User.new
u.name="vivek"
u.password="vivek"
u.email="vivek@gmail.com"
u.phone="1234567893"
u.pref_amount="45"
u.pref_location="College Main"
u.pref_provider="Verizon"
u.save

t=Transaction.new
t.amount=45
t.phone_number=1234567893
t.provider="Verizon"
t.location="College Main"
t.status="Recharged"
t.user=u
t.save

t=Transaction.new
t.amount=100
t.phone_number=1234567893
t.provider="Verizon"
t.location="College Main"
t.status="Scheduled"
t.user=u
t.save


u=User.new
u.name="habib"
u.password="habib"
u.email="habib@gmail.com"
u.phone="1234567894"
u.pref_amount="32"
u.pref_location="College Main"
u.pref_provider="T-Mobile"
u.save


t=Transaction.new
t.amount=45
t.phone_number=1234567894
t.provider="T-Mobile"
t.location="College Main"
t.status="Scheduled"
t.user=u
t.save
=end

#-------------------------------------------------------------------------------

l=Location.new
l.location="College Main"
l.save

l=Location.new
l.location="Cherry Hollows"
l.save

l=Location.new
l.location="Gardens"
l.save

l=Location.new
l.location="Scandia"
l.save

#-------------------------------------------------------------------------------

n=Provider.new
n.provider="Lyca"
n.save

n=Provider.new
n.provider="T-Mobile"
n.save

n=Provider.new
n.provider="Verizon"
n.save

n=Provider.new
n.provider="AT&T"
n.save

n=Provider.new
n.provider="Sprint PCS"
n.save



#-------------------------------------------------------------------------------

Admin.create(name:'shaik' ,email: 'shaik@gmail.com',password: 'shaik')
