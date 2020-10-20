# frozen_string_literal: true
# encoding: utf-8

class Override
  include Mongoid::Document

  def self.public_method
  end

  protected

  def self.protected_method
  end

  private

  def self.private_method
  end
end
