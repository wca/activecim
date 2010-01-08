require File.join(File.dirname(__FILE__), 'test_helper')
require 'active_cim/base'

CIM_URI = "http://localhost:5988/root/cimv2"

class CIM_FileSystem < ActiveCim::Base
  self.site = CIM_URI
end

class CIM_ComputerSystem < ActiveCim::Base
  self.site = CIM_URI
end


class TC_ActiveCim_Base < Test::Unit::TestCase

  context "all instances of class FileSystem" do

    setup do 
      @filesystems = CIM_FileSystem.find(:all)
    end

    should "have an object path" do
      assert_equal("#{CIM_URI}:CIM_FileSystem", CIM_FileSystem.object_path)
    end

    should "be at least a filesystem" do
      assert(! @filesystems.empty?)
    end

    should "have full properties" do
      assert(@filesystems.first.available_space > 0)
      assert_kind_of(Fixnum, @filesystems.first.available_space)
    
      assert_nothing_raised do
        @filesystems.each do |fs|
          assert_kind_of Fixnum, fs.file_system_size
          assert fs.file_system_size > 0

          assert_kind_of String, fs.root
        end
      end
    end
  end


  context "all instances of class ComputerSystem" do

    setup do 
      @computers = CIM_ComputerSystem.find(:all)
    end

    should "have an object path" do
      assert_equal("#{CIM_URI}:CIM_ComputerSystem", CIM_ComputerSystem.object_path)
    end

    should "be at least a computer" do
      assert(! @computers.empty?)
    end

    should "have full properties" do
      pp @computers.first
      #assert(@filesystems.first.available_space > 0)
      #assert_kind_of(Fixnum, @filesystems.first.available_space)
    
      #assert_nothing_raised do
      #  @filesystems.each do |fs|
      #    assert_kind_of Fixnum, fs.file_system_size
      #    assert fs.file_system_size > 0
#
 #         assert_kind_of String, fs.root
  #      end
   #   end
    end
  end

  
end
