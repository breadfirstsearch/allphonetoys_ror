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

u=User.new
u.name="jibin"
u.password="jibin"
u.email="jibin@gmail.com"
u.phone="1234567890"
u.pref_amount="19"
u.pref_location=3
u.pref_provider=1
u.save

t=Transaction.new
t.amount=19
t.phoneNumber=1234567890
t.provider=1
t.location=3
t.status=2
t.user=u
t.save

t=Transaction.new
t.amount=45
t.phoneNumber=1234567890
t.provider=1
t.location=3
t.status=1
t.user=u
t.save

u=User.new
u.name="christopher"
u.password="christopher"
u.email="christopher@gmail.com"
u.phone="1234567891"
u.pref_amount="23"
u.pref_location=3
u.pref_provider=1
u.save

t=Transaction.new
t.amount=23
t.phoneNumber=1234567891
t.provider=1
t.location=3
t.status=2
t.user=u
t.save

u=User.new
u.name="kavya"
u.password="kavya"
u.email="kavya@gmail.com"
u.phone="1234567892"
u.pref_amount="26"
u.pref_location=1
u.pref_provider=3
u.save

t=Transaction.new
t.amount=26
t.phoneNumber=1234567892
t.provider=3
t.location=1
t.status=3
t.user=u
t.save

u=User.new
u.name="vivek"
u.password="vivek"
u.email="vivek@gmail.com"
u.phone="1234567893"
u.pref_amount="45"
u.pref_location=1
u.pref_provider=3
u.save

t=Transaction.new
t.amount=45
t.phoneNumber=1234567893
t.provider=3
t.location=1
t.status=3
t.user=u
t.save

t=Transaction.new
t.amount=100
t.phoneNumber=1234567893
t.provider=3
t.location=1
t.status=1
t.user=u
t.save


u=User.new
u.name="habib"
u.password="habib"
u.email="habib@gmail.com"
u.phone="1234567894"
u.pref_amount="32"
u.pref_location=1
u.pref_provider=2
u.save


t=Transaction.new
t.amount=45
t.phoneNumber=1234567894
t.provider=2
t.location=1
t.status=1
t.user=u
t.save

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


n=Provider.new
n.provider="Lyca"
n.save

n=Provider.new
n.provider="T mobile"
n.save

n=Provider.new
n.provider="Verizon"
n.save

Admin.create(name:'shaik' ,email: 'shaik@gmail.com',password: 'shaik')
